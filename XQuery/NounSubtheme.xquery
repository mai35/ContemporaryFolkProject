xquery version "3.0";

let $songsCollect := collection('/db/course/folk')
let $songs := $songsCollect//song
let $distinctNouns := distinct-values($songsCollect//noun)
return 
    <div>
    {
        for $noun in $distinctNouns
            return
                <distNoun>
                    if (exists($noun/@subtheme)) then
                        <noun>{$noun}</noun>
                        <subtheme>{$noun/@subtheme}</subtheme>
                    else()
                </distNoun>    
    }</div>