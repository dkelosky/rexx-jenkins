import { exists, zowe } from './zowe.mjs';
import config from "config";

const dataSet = config.get('target');
if (!exists(dataSet)) zowe(`zowe files create pds ${dataSet}`);
else console.log(`${dataSet} exists`);