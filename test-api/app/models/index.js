const config = require('../config/config');
const neo4j  = require('neo4j-driver');
const driver = neo4j.driver(config.url, neo4j.auth.basic(config.user, config.password));

module.exports = driver;