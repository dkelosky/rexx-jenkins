import { execSync } from 'child_process';

export function zowe(cmd) {
    try {
        const resp = execSync(cmd);
        console.log(resp.toString().trim());
    } catch (e) { }
}

export function exists(dsn) {
    if (dsn.indexOf('(') > -1) {
        const dsnParts = dsn.split('(');
        const dataSet = dsnParts[0];
        const member = dsnParts[1].replace(')', '');
        if (dsnExists(dataSet)) return memberExists(dataSet, member);
    } else return dsnExists(dsn);

    return false;
}

function memberExists(dsn, member) {
    const cmd = `zowe files list am ${dsn}`;
    try {
        const resp = execSync(cmd);
        const members = resp.toString().trim().split(/\r?\n/g);
        for (let i = 0; i < members.length; i++) {
            if (members[i].trim() === member) return true;
        }
    } catch (e) { }
    return false;
}

function dsnExists(dsn) {
    const cmd = `zowe files list ds ${dsn}`;
    try {
        const resp = execSync(cmd);
        return resp.toString().trim() !== '';
    } catch (e) { }
    return false;
}