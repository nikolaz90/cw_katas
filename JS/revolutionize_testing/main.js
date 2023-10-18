import Requester from './requester.js'

console.log('Starting the test...');

const url = 'https://www.letsrevolutionizetesting.com/challenge.json';
const requester = new Requester(url);

requester.start();
