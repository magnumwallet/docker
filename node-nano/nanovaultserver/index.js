require('dotenv').config(); // Load variables from .env into the environment

const timestamps = require('./timestamps');

/** Configuration **/
const nanoNodeUrl = process.env.NANO_NODE_URL || `http://127.0.0.1:7077`; // Nno node RPC url
const nanoWorkNodeUrl = process.env.NANO_WORK_NODE_URL || `http://127.0.0.1:7077`; // Nano work node RPC url
const listeningPort = process.env.APP_PORT || 2048; // Port this app will listen on

const useDPoW = !!process.env.USE_DPOW || false; // Is the Distributed Proof of Work system used? (Requires API Key)

const useRedisCache = !!process.env.USE_REDIS || true; // Change this if you are not running a Redis server.  Will use in memory cache instead.
const redisCacheUrl = process.env.REDIS_HOST || `172.31.25.214`; // Url to the redis server (If used)
const redisCacheTime = 60 * 60 * 24; // Store work for 24 Hours
const memoryCacheLength = 800; // How much work to store in memory (If used)

const express = require('express');
const request = require('request-promise-native');
const cors = require('cors');
const { promisify } = require('util');

const workCache = [];
let getCache, putCache;

// Set up the webserver
const app = express();
app.use(cors());
app.use(express.json());