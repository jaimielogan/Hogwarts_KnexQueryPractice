var express = require('express');
var router = express.Router();
var query = require('../db/query');

/* GET home page. */
router.get('/', function(req, res, next) {
  query.getAllHouses()
  .then(function(data) {
    res.send(data);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/students', function(req,res,next){
  query.getAllStudents()
  .then(function(data){
    res.send(data);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/professors', function(req,res,next){
  query.getAllProfessors()
  .then(function(data){
    res.send(data);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/gryffindor', function(req,res,next){
  query.gryffindor()
  .then(function(data){
    res.send(data);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/students/:studentname', function(req,res,next){
  query.getStudentByName(req.params.studentname)
  .then(function(data){
    var studentName = data[0].name;
    res.render('student',{
      studentName:studentName,
      studentdata: data[0]
    });
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/professors/:professorname', function(req,res,next){
  query.getProfessorByName(req.params.professorname)
  .then(function(data){
    res.send(data);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/students/:name/:house_id/:year/:patronus', function(req,res,next){
  var name = req.params.name,
      house_id = req.params.house_id,
      year = req.params.year,
      patronus = req.params.patronus;

  query.insertNewStudent(name,house_id,year,patronus)
  .then(function(){
    var path = '/students/' + name;
    res.redirect(path);
  })
  .catch(function(err){
    return next(err);
  });
});

router.get('/students/delete/:studentname', function(req,res,next){
  query.deleteStudentByName(req.params.studentname)
  .then(function(){
    res.redirect('/students');
  })
  .catch(function(err){
    return next(err);
  });
});


router.get('/students/update/:studentname/:patronus', function(req,res,next){
  query.updateStudentPatronus(req.params.studentname,req.params.patronus)
  .then(function(){
    var path = '/students/' + req.params.studentname;
    res.redirect(path);
  })
  .catch(function(err){
    return next(err);
  });
});

module.exports = router;
