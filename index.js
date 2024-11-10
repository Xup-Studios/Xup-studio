const admin = require('firebase-admin');
const express = require('express');
const app = express();

// Initialize Firebase Admin SDK
const serviceAccount = require('./serviceAccountKey.json');
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

app.use(express.json());

// Define routes and start the server later in this guide
app.post('/setUserRole', async (req, res) => {
    const { email, role } = req.body;
  
    if (!email || !role) {
      return res.status(400).send('Email and role are required');
    }
  
    try {
      // Get the user by email
      const user = await admin.auth().getUserByEmail(email);
  
      // Set custom claims (role) for the user
      await admin.auth().setCustomUserClaims(user.uid, { role });
  
      res.status(200).send(`Role ${role} assigned to user ${email}`);
    } catch (error) {
      console.error('Error setting user role:', error);
      res.status(500).send('Error setting user role');
    }
  });

  const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
