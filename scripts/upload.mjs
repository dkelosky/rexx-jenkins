import { zowe, exists, upload } from './zowe.mjs';
import config from "config";
import { readdir } from 'fs';
import { promisify } from 'util';
import { basename, extname } from 'path';

const readdirp = promisify(readdir);

const source = config.get('source');
const dataSet = config.get('target');

if (!exists(dataSet)) {
    console.log(`${dataSet} target does not exist`);
    process.exit(1);
}

(async () => {
    const dir = await readdirp(source);
    dir.forEach(async (file) => {
        upload(dataSet, source, file);
    });
})();