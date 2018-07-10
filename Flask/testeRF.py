from flask import Flask, render_template, url_for, request, redirect
from flask_pymongo import PyMongo

app = Flask(__name__)

app.config['MONGO_DBNAME'] = 'teste_db' #define qual db mongo o app vai se conectar
app.config['MONGO_URI'] = 'mongodb://testerendafixa:standbY15@ds125871.mlab.com:25871/teste_db' #define a URI mongo

mongo = PyMongo(app)

@app.route('/') 
def get_record(): #define metodo para recuperar os dados inseridos no db
    usuario=mongo.db.catalogo #colecao a ser consultada
    x=usuario.find({}) #realiza a busca pelos dados
    return render_template('catalogo.html' , query = x) #renderiza o html que exibira os dados

@app.route('/inserir', methods=['POST', 'GET']) 
def insert_record(): 
  #verifica se existe duplicidade de nome no catalogo
  if request.method == 'POST': 
    usuario=mongo.db.catalogo 
    usuario_existente = usuario.find_one({'nome' : request.form['nome']})  

    #caso não haja duplicidade insere os dados no DB
    if usuario_existente is None:
      usuario.insert({'nome' : request.form['nome'], 'email' : request.form['email'], 'telefone' : request.form['telefone']})
      return redirect(url_for('get_record'))

    return 'Este nome ja está registrado!'

  return render_template('insere_usuario.html')

if __name__ == '__main__':
  app.secret_key = 'rendafixa'
  app.run(debug=True)