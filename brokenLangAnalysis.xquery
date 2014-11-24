xquery version "3.0";
declare default element namespace "http://www.w3.org/1999/xhtml";
let $songsCollect := collection('/db/course/folk')
let $songs := $songsCollect//song
let $distinctThemes := distinct-values($songsCollect//*:theme)
return 
  <html>
    <head><title>Songs By Theme</title></head>
    <body>{
        for $theme in $distinctThemes
            let $themeSongs := $songs[.//*:theme = $theme]
            let $themeTitles := $themeSongs//*:title           
            let $themeCount := count($themeSongs)
            let $langs := $themeTitles/ancestor::*:songs/@language
            let $distinctLangs := distinct-values($themeTitles/ancestor::*:songs/@language)
            order by $theme ascending
            return $distinctLangs
                (:(<h1>{$theme || ' (' || $themeCount || '):'}</h1>,
                <ol>{
                    for $title in $themeTitles
                        let $language := $title/ancestor::*:songs/@language
                        let $themeArtist := $title/following-sibling::*:artist
                        order by $title ascending
                        return <li>{$title/string() || ' (' || $language/string() || ')' || ' by ' || $themeArtist/string()}</li>
                }</ol>,
                <ol>{
                    for $language in $langs
                        let $themeLangs := $themeTitles[./ancestor::*:songs/@language = $language]
                        let $langCount := count($themeLangs)
                        return ($themeLangs, <li>{$language || ' (' || $langCount || ')'}</li>)
                }</ol>):)
    }</body>
</html>