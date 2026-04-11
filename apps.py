from flask import Flask , render_template, url_for, request, flash, redirect, session
from database import conectar

apps = Flask (__name__)
apps.secret_key = "4648754"
@apps.route('/')
def login():
    return render_template("login.html")

@apps.route('/login',methods=['POST'])
def login_form():
    user = request.form["txtusuario"]
    password = request.form["txtcontrasena"]
    
    con = conectar()
    cursor = con.cursor()
    
    sql = "SELECT * FROM usuarios WHERE usuario = %s AND password = %s" 
    cursor.execute(sql, (user, password))
    user = cursor.fetchone()
    
    if user:
        session['usuario'] = user[1]
        session['rol'] = user[3]
        
        rol = user[3] 
        #if rol == rol:
        if user[3] == "administrador":
            
            return redirect("inicio")
        
        elif user[3] == "empleado":
            
            return "Bienvenido empleado"
        
    else:
        
        
        flash ("Uusario o contraseña incorrecta" , "danger")
        return redirect(url_for('login'))
    
        
@apps.route('/inicio')
def inicio():
    if 'usuario' not in session:
        return redirect(url_for('login'))  
    con = conectar()
    cursor = con.cursor()
    
    sql = "SELECT * from usuarios"
    cursor.execute(sql)
    usuarios = cursor.fetchall()
    
    cursor.execute("SELECT * FROM empleados")
    empleados = cursor.fetchall()

    return render_template('index.html', user=usuarios, emple=empleados)


@apps.route('/salir')
def salir():
    session.clear()
    return redirect(url_for('login'))

@apps.route('/eliminar/<int:id>')
def eliminarusu(id):
    if  'usuario' not in session:
        return redirect(url_for('login'))  
    con = conectar()
    cursor = con.cursor()
    
    sql = "SELECT rol FROM usuarios WHERE id_usuario = %s"
    cursor.execute(sql, (id,))
    usuario = cursor.fetchone()
    
    if usuario:
        rol = usuario[0]
        if rol == "administrador":
            flash("No se puede eliminar el administrador")
            return redirect(url_for("inicio"))
        else:
            cursor.execute("DELETE FROM usuarios WHERE id_usuario = %s", (id,))
            con.commit()
            flash("Empleado eliminado")
    
    cursor.close()
    con.close()
    return redirect(url_for("inicio"))

@apps.route("/guardar_usuario", methods=["POST"])
def guardar_usuario():
    usuario = request.form["txtusuario"]
    password = request.form["txtcontrasena"]
    rolusu = request.form["txtrol"]
    documento = request.form["txtdocumento"]
    
    con = conectar()
    cursor = con.cursor()
    sql = "INSERT INTO usuarios (usuario, password, rol, docuemple) VALUES (%s, %s, %s, %s)"
    
    cursor.execute(sql, (usuario, password, rolusu, documento))
    con.commit()
    return redirect(url_for("inicio"))
     

@apps.route("/registrar_empleado", methods=["POST"])
def registrar_empleado():
    documento = request.form["documento"]
    nombre = request.form["nombre"]
    apellido = request.form["apellido"]
    cargo = request.form["cargo"]
    hextra = int(request.form["hextra"])
    bonificacion = float(request.form["bonificacion"])
    departamento = request.form["departamento"]
    
    def SalarioBase():
        if cargo == "gerente":
            return 5000000
        elif cargo == "administrador":
            return 3500000
        elif cargo == "contador":
            return 2800000
        else:
            return 1800000
    
    salarioBase = SalarioBase()
    valorHExtra = hextra * 3000
    salariobru = salarioBase + valorHExtra + bonificacion
    salud = salariobru * 0.04
    pension = salariobru * 0.04
    salarioneto = salariobru - salud - pension
        
    con = conectar()
    cursor = con.cursor()
    sqldepa = "SELECT id_are FROM departamentos WHERE Nombre = %s"
    cursor.execute(sqldepa, (departamento,))
    resultado = cursor.fetchone()
    if resultado:
        departamento = resultado[0]
        #guardar en base de datos 
        sql = "INSERT INTO empleados (DocumentoEmple, NombreEmple, ApellidoEmple, Cargo, HoraExtra, Bonificacion, SalarioB, Salud, Pension, SalarioNeto, idDep) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        
        datos = (documento, nombre, apellido, cargo, hextra, bonificacion, salariobru, salud, pension, salarioneto, departamento)
        cursor.execute(sql, datos)
        con.commit()
        print("Empleado guardado en la base de datos")
    else:
        print("El departamento no existe, por favor registre el departamento antes de registrar el empleado")
    return redirect(url_for("inicio"))
     
@apps.route('/eliminaremple/<int:id>')
def eliminaremple(id):
    if 'usuario' not in session:
        return redirect(url_for('login'))  
    con = conectar()
    cursor = con.cursor()
    
    sqlemple = "SELECT DocumentoEmple FROM empleados WHERE id = %s"
    cursor.execute(sqlemple, (id,))
    resultado = cursor.fetchone()
    
    if resultado:
        documento = resultado[0]
        sql = "DELETE FROM usuarios WHERE docuemple = %s"
        cursor.execute(sql, (documento,))
        con.commit()
        flash("Usuario eliminado")
        
        documento = resultado[0]
        sql2 = "DELETE FROM empleados WHERE id = %s"
        cursor.execute(sql2, (id,))
        con.commit()
        flash("Empleado eliminado")
        
        cursor.close()
        con.close()
    return redirect(url_for("inicio"))

if __name__ == "__main__":
    apps.run(debug=True)