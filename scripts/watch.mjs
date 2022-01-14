import { watch } from 'fs';
import { upload } from './zowe.mjs';
import { exists } from './zowe.mjs';
import config from "config";

let watching = false;

const source = config.get('source');
const dataSet = config.get('target');

if (!exists(dataSet)) {
    console.log(`${dataSet} target does not exist`);
    process.exit(1);
}

console.log(`Watching ${source} for changes...`);
watch(`${source}`, { recursive: false }, (eventType, filename) => {
    if (watching) return;
    watching = true;

    // console.log(`${eventType} ${filename}`);
    console.log(`Uploading ${filename} from ${source} to ${dataSet}`);
    upload(dataSet, source, filename);

    // watch is silly, we need to make sure it's not called twice
    setTimeout(() => {
        watching = false;
    }, 100);
});
