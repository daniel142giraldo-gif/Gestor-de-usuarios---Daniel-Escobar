from flask import Flask, render_template, request
from database import conectar
#Crear la app
app = Flask(__name__)

#Crear la ruta principal
@app.route('/')
def principal():
    return render_template('index.html')
    

@app.route('/validar_usuario', methods=['POST'])    
def validar_usuario(): 
    
    sql = "SELECT * FROM empleados WHERE usuario = %s AND password = %s"
    usuario = request.form['txtusuario']
    password = request.form['txtcontraseña']
    
    con = conectar()
    cursor = con.cursor
    cursor.execute(sql, (usuario, password))
    resultado = cursor.fetchone()
    
    if resultado:
        return "Usuario guardado"
    else:
        return "Empleado no existe"
    
if __name__ == '__main__':
    app.run(debug=True)