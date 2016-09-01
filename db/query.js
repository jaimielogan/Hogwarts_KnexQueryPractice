var knex = require('./knex');

function getAllHouses() {
  return knex('houses');
}

function getAllStudents() {
  return knex('students');
}

function getAllProfessors() {
  return knex('professors');
}

function gryffindor() {
  return knex('students').select('students.name', 'students.patronus').innerJoin('houses','students.house_id','houses.id').where('houses.name','Gryffindor');
}

function getStudentByName(name) {
  return getAllStudents().where('name', name);
}

module.exports = {
  getAllHouses: getAllHouses,
  getAllStudents: getAllStudents,
  getAllProfessors: getAllProfessors,
  gryffindor: gryffindor,
  getStudentByName: getStudentByName,
  getProfessorByName: function(name){
    return getAllProfessors().where('name',name);
  },
  insertNewStudent: function(name, house_id, year, patronus){
    return getAllStudents().insert({
      name: name,
      house_id: house_id,
      year: year,
      patronus: patronus
    });
  },
  updateStudentPatronus: function(name,patronus){
    return getAllStudents().update({
      patronus: patronus
    }).where('name',name);
  },
  deleteStudentByName: function(name){
    return knex('students').where('name',name).del();
  }
};
