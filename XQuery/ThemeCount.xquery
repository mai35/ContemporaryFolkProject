xquery version "3.0";

let $songsCollect := collection('/db/course/folk')
let $songs := $songsCollect//*:song
let $distinctThemes := distinct-values($songsCollect//*:theme)
return 
    <themeCount>
    {
        for $theme in $distinctThemes
            let $themeSongs := $songs[.//*:theme = $theme]
            let $themeTitles := $themeSongs//*:title
            let $themeCount := count($themeSongs)
            order by $theme ascending
            return(
                <theme>
                    <name>{$theme}</name>
                    <count>{$themeCount}</count>
                </theme>
            )
    }</themeCount>