const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 8000;

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pog'
});

db.connect((err) => {
    if(err) console.log(err);

    console.log('Connected to the Database');
});


//user FUNCTIONS

app.get(
    '/users', (req, res) => {
        const sql = 'SELECT * FROM user';
        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.get(
    '/users/:email', (req, res) => {
        const email = req.params.email;
        const sql = `SELECT * FROM user WHERE email = '${email}'`;

        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.post('/users/createUser', (req, res) => {
    const {user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex, image_url} = req.body; // Ganti dengan nama kolom yang sesuai
    const sql = 'INSERT INTO user (user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);'; // Ganti "table_name" dan "column1, column2, ..." dengan nama tabel dan kolom yang sesuai
    db.query(sql, [user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex, image_url], (err, result) => {
      if (err) {
        throw err;
      }
      res.send(result);
    });
  });

app.put('/users/updateUser/:user_id', (req, res) => {
    const user_id = req.params.user_id;
    const {address, birth_date, phone_number, sex, image_url} = req.body;
    const sql = `UPDATE user SET address = ?, birth_date = ?, phone_number = ?, sex = ?, image_url = ? WHERE user_id = '${user_id}'`;
  
    db.query(sql, [address, birth_date, phone_number, sex, image_url], (err, result) => {
      if(err) throw err;

      res.send(result);
    });
  });
  
  //organization FUNCTIONS

  app.post('/organizations/createOrganization', (req, res) => {
    const {organization_id, organization_key, organization_name, organization_desc, 
      organization_address, email, phone_number, image_url} = req.body;
    const sql = `INSERT INTO organization (organization_id, organization_key, organization_name, organization_desc, organization_address, email, phone_number, image_url) 
    VALUES (?,?,?,?,?,?,?, ?)`;

    db.query(sql, [organization_id, organization_key, organization_name, organization_desc, 
      organization_address, email, phone_number, image_url], (err, result) => {
        if(err) throw err;

        res.send(result);
      });
  });

  app.put('/organizations/updateOrganization/:organization_id', (req,res) =>{
    const organization_id = req.params.organization_id;
    const {organization_name, organization_desc, organization_address, email, phone_number, image_url} = req.body;
    const sql = `UPDATE organization SET organization_name = ?, organization_desc = ?, organization_address = ?, email = ?, phone_number = ?, image_url = ? WHERE organization_id = '${organization_id}'`;

    db.query(sql, [organization_name, organization_desc, organization_address, email, phone_number, image_url], (err, result) =>{
        if(err) throw err;

        res.send(result);
      });
  });

  app.get(
    '/organizations', (req, res) => {
        const sql = 'SELECT * FROM organization';
        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.get('/organizations/:organization_id', (req, res) =>{
  const organization_id = req.params.organization_id;
  const sql = `SELECT * FROM organization WHERE organization_id = '${organization_id}'`;
  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

//member

app.get('/members', (req,res) => {
  const sql = `SELECT * FROM member`;
  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.post('/members/insertMember', (req,res) =>{
  const{member_id, user_id, organization_id} = req.body;
  const sql = `INSERT INTO member (member_id, user_id, organization_id) VALUES (?,?,?)`;
  db.query(sql, [member_id, user_id, organization_id], (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.get('/members/organizations/:user_id', (req, res) => {
  const user_id = req.params.user_id;
  const sql = `SELECT organization.organization_id ,organization.organization_name, organization.organization_desc, organization.image_url from organization
  JOIN member ON organization.organization_id = member.organization_id
  JOIN user ON member.user_id = user.user_id
  WHERE user.user_id = '${user_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

//eventS FUNCTIONS

app.post('/events/createEvent', (req, res) =>{
  const {event_id, event_name, event_desc, event_date, committee_amount, participant_amount, image_url, organization_id} = req.body;
  const sql = `INSERT INTO event (event_id, event_name, event_desc, event_date, committee_amount, participant_amount, image_url, organization_id)
    VALUES (?,?,?,?,?,?,?,?)`;

    db.query(sql, [event_id, event_name, event_desc, event_date, committee_amount, participant_amount, image_url, organization_id], (err, result)=>{
      if(err) throw err;

      res.send(result);
    });

});

app.get('/events', (req, res) =>{
  const sql = `SELECT * FROM event`;
  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.get('/events/:organization_id', (req, res) => {
  const organization_id = req.params.organization_id;
  const sql = `SELECT * FROM event WHERE organization_id = '${organization_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

//application

app.get('/applications', (req, res) =>{
  const sql = `SELECT * FROM application`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.post('/applications/insertApplicant', (req, res) => {
  const {application_id, application_type, user_id, event_id} = req.body;
  const sql = `INSERT INTO application (application_id, application_type, user_id, event_id)
  VALUES (?,?,?,?)`;

  db.query(sql, [application_id, application_type, user_id, event_id], (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.get('/applications/:user_id', (req, res) => {
  const user_id = req.params.user_id;
  const sql = `SELECT event.event_id, event.event_name, event.event_desc, event.event_date, event.committee_amount, event.participant_amount, event.image_url, event.organization_id from event JOIN application on event.event_id = application.event_id JOIN user on application.user_id = user.user_id WHERE user.user_id = '${user_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });

});

app.get('/applications/unRegistered/:user_id', (req, res) => {
  const user_id = req.params.user_id;
  const sql = `SELECT DISTINCT event.event_id, event.event_name, event.event_desc, event.event_date, event.committee_amount, event.participant_amount, event.image_url, event.organization_id FROM event
  JOIN organization ON event.organization_id =  organization.organization_id
  JOIN member ON organization.organization_id = member.organization_id
  JOIN application ON member.user_id = application.user_id
  WHERE event.event_id NOT IN(SELECT application.event_id FROM application WHERE application.user_id = '${user_id}')
  AND member.user_id = '${user_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.delete('/applications/deleteApplicant/:event_id', (req, res) => {
  const event_id = req.params.event_id;
  const sql = `DELETE FROM application WHERE event_id = '${event_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.delete('/events/deleteEvent/:event_id', (req, res) => {
  const event_id = req.params.event_id;
  const sql = `DELETE FROM event WHERE event_id = '${event_id}'`;

  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});



app.listen(port, () => {
    console.log('Server is running on port 8000');
});