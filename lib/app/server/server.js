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


//USER FUNCTIONS

app.get(
    '/users', (req, res) => {
        const sql = 'SELECT * FROM USER';
        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.get(
    '/users/:email', (req, res) => {
        const email = req.params.email;
        const sql = `SELECT * FROM USER WHERE email = '${email}'`;

        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.post('/users/createUser', (req, res) => {
    const {user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex} = req.body; // Ganti dengan nama kolom yang sesuai
    const sql = 'INSERT INTO USER (user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);'; // Ganti "table_name" dan "column1, column2, ..." dengan nama tabel dan kolom yang sesuai
    db.query(sql, [user_id, lastname, firstname, email, password, address, birth_date, phone_number, sex], (err, result) => {
      if (err) {
        throw err;
      }
      res.send(result);
    });
  });

app.put('/users/updateUser/:user_id', (req, res) => {
    const user_id = req.params.user_id;
    const {address, birth_date, phone_number, sex} = req.body;
    const sql = `UPDATE user SET address = ?, birth_date = ?, phone_number = ?, sex = ? WHERE user_id = '${user_id}'`;
  
    db.query(sql, [address, birth_date, phone_number, sex], (err, result) => {
      if(err) throw err;

      res.send(result);
    });
  });
  
  //ORGANIZATION FUNCTIONS

  app.post('/organizations/createOrganization', (req, res) => {
    const {organization_id, organization_key, organization_name, organization_desc, 
      organization_address, email, phone} = req.body;
    const sql = `INSERT INTO ORGANIZATION (organization_id, organization_key, organization_name, organization_desc, organization_address, email, phone_number) 
    VALUES (?,?,?,?,?,?,?)`;

    db.query(sql, [organization_id, organization_key, organization_name, organization_desc, 
      organization_address, email, phone], (err, result) => {
        if(err) throw err;

        res.send(result);
      });
  });

  app.get(
    '/organizations', (req, res) => {
        const sql = 'SELECT * FROM ORGANIZATION';
        db.query(sql, (err, result) => {
            if(err) throw err;

            res.send(result);
        });
    }
);

app.get('/organizations/:organization_id', (req, res) =>{
  const organization_id = req.params.organization_id;
  const sql = `SELECT * FROM ORGANIZATION WHERE organization_id = '${organization_id}'`;
  db.query(sql, (err, result) => {
    if(err) throw err;

    res.send(result);
  });
});

app.listen(port, () => {
    console.log('Server is running on port 8000');
});