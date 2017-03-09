const crypto = require('crypto');

const secret = 'abcdef123456';

const hash = crypto.createHmac('sha256', secret)
                   .update('I love cupcakes')
                   .digest('hex');
console.log(hash);
