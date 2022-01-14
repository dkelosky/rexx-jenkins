import { exists, zowe, readTsoKey } from './zowe.mjs';
import config from "config";

const member = process.argv[2];
if (!member) {
    console.log(`Usage ${process.argv[1]} <member>`);
    process.exit(1);
}
const source = config.get('source');
const dataSet = config.get('target');

const rexx = `${dataSet}(${member})`.toUpperCase();

if (!exists(rexx)) {
    console.log(`${rexx} does not exist`);
    process.exit(1);
}

const key = readTsoKey();

zowe(`zowe tso send as ${key} --data "ex '${rexx}'"`);