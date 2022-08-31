import { zowe, exists } from './zowe.mjs';
import config from "config";

const dataSet = config.get('target');
if (exists(dataSet)) zowe(`files delete ds ${dataSet} -f`);
else console.log(`${dataSet} does not exist`);