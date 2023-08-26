require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require('body-parser');
const dns = require('dns');

// Basic Configuration
const port = process.env.PORT || 3000;

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

const shortendUrls = [];
let shortUrlSequence = 1;

app.post('/api/shorturl', function(req, res) {
  console.log(req.body.url);
  try {
    const url = new URL(req.body.url);

    dns.lookup(url.host, function(err) {
      if (err !== null) {
        return res.json({
          error: 'invalid url'
        });
      }
  
      const previousShorturl = shortendUrls.find(
        shorturl => shorturl.original_url === url.href
      );
      
      if (previousShorturl !== undefined) {
        return res.json(previousShorturl);
      }
  
      const shortendUrl = {
        original_url: url.href,
        short_url: shortUrlSequence
      };
  
      shortendUrls.push(shortendUrl);
  
      res.json(shortendUrl);
      
      shortUrlSequence++;
    });
  } catch {
    return res.json({
      error: 'invalid url'
    });
  }
});

app.get('/api/shorturl/:shorturl', function(req, res) {
  const shorturl = req.params.shorturl;

  if (shorturl == 0) {
    return res.json({
      error: 'Wrong format'
    });
  }
  
  const foundShortendUrl = shortendUrls.find(
    shortendUrl => shortendUrl.short_url == shorturl
  );

  if (foundShortendUrl === undefined) {
    return res.json({
      error: 'No short URL found for the given input'
    });
  }

  res.set('Location', foundShortendUrl.original_url);
  res.status(302).end();
})

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});
