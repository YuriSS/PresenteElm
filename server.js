const express = require ("express")
const app = express ()
const path = require ("path")

const compose = fs => init =>
    fs.reduceRight ((acc,f) => f (acc), init)

const log = msg => x =>
    (console.log (`${msg}: `, x), x)

const pathJoin = x => y =>
    path.join (x, y)

const dirPathJoin =
    pathJoin (__dirname)


const static =
    compose (
        [ app.use.bind (app)
        , express.static.bind (express)
        , dirPathJoin
        ]
    )

const render = x =>
    app.use ("/", (req, res, next) => compose ([ res.sendFile.bind(res), dirPathJoin ]) (x))

const server = port =>
    app.listen(port, _ => console.log (`Server running on ${port}`))


static ("/dist")
render ("/dist/index.html")
server (3030)   