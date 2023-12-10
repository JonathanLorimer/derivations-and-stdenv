const fs = require('node:fs/promises');
const util = require('node:util');
const exec = util.promisify(require('node:child_process').exec);
const attrsFile = process.env.NIX_ATTRS_JSON_FILE;

async function builder() {
  try {
    // Get attr args
    const data = await fs.readFile(attrsFile, { encoding: 'utf8' });
    const attrs = JSON.parse(data)
    console.group("attrs details")
    console.log("attrsFile: ", attrsFile)
    console.log("attrs: ", attrs)
    console.groupEnd()

    try {
      // Write output
      const content = "Hello from javascript"
      const cowsayCmd = `${attrs.cowsay}/bin/cowsay ${content}`
      await fs.mkdir(attrs.outputs.out)
      await fs.writeFile(`${attrs.outputs.out}/hello.txt`, content);

      // Do some other stuff
      const {stdout} = await exec(cowsayCmd)
      console.log(stdout)

    } catch (err) {
      console.log(err);
    }
  } catch (err) {
    console.log(err);
  }
}

builder();
