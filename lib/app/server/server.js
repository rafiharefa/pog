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
    const {id_user, lastname, firstname, email, password, address, birth_date, phone_number, sex} = req.body; // Ganti dengan nama kolom yang sesuai
    const sql = 'INSERT INTO USER (id_user, lastname, firstname, email, password, address, birth_date, phone_number, sex) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);'; // Ganti "table_name" dan "column1, column2, ..." dengan nama tabel dan kolom yang sesuai
    db.query(sql, [id_user, lastname, firstname, email, password, address, birth_date, phone_number, sex], (err, result) => {
      if (err) {
        throw err;
      }
      res.send(result);
    });
  });

app.listen(port, () => {
    console.log('Server is running on port 8000');
});