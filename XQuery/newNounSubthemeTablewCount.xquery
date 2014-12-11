xquery version "3.0";
declare namespace html="http://www.w3.org/1999/xhtml";
let $subthemes := doc('/db/course/folk/nounSubtheme.xml')//html:nounSubthemes
return
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <title>Noun Subtheme Analysis</title>
            <link href="css/menu.css" rel="stylesheet" type="text/css" />
        </head>
        <body>
            <div class="header">
         <img src="images/Flags.png" alt="Flags" />
      </div>
      <!--#include virtual="include/menu.html"-->
      <div class="content">
         <h1>Contemporary Folk Music</h1>
         <h2>Analysis</h2>
         <h3>Table of all Nouns with Subthemes</h3>
         <p>This table is used to focus on the nouns within folk songs that specifically have a
            subtheme attached in order to visualize our data and to aid in analyzing any
            correlations between subthemes and themes across songs and languages.</p>
            <table border="1">
                <tr>
                    <th>Noun</th>
                    <th>Language</th>
                    <th>Song Title</th>
                    <th>Song Theme</th>
                    <th>Noun Subtheme</th>
                    <th>Noun Subtheme Count</th>
                </tr>
    {
for $subtheme in $subthemes
group by $item := $subtheme/html:subtheme
return
                
                let $distinctNouns := distinct-values($subtheme//html:noun)
                for $distinctNoun in $distinctNouns
                let $language := distinct-values($subtheme/html:noun[. = $distinctNoun]/following-sibling::html:language)
                let $songTitle := distinct-values($subtheme/html:noun[. = $distinctNoun]/following-sibling::html:songTitle)
                let $songTheme := distinct-values($subtheme/html:noun[. = $distinctNoun]/following-sibling::html:songTheme)
                let $nounSubtheme := distinct-values($subtheme/html:noun[. = $distinctNoun]/following-sibling::html:subtheme)
                order by $distinctNoun ascending
                return 
                <tr>
                    <th>{$distinctNoun}</th>
                    <th>{$language}</th>
                    <th>{string-join($songTitle, ", ")}</th>
                    <th>{string-join($songTheme, ", ")}</th>
                    <th>{$nounSubtheme}</th>
                    <th>{count($subtheme[html:noun eq $distinctNoun])}</th>
                </tr>}
            </table>
            <div class="creativeCommons">
            <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">
               <img alt="Creative Commons License" style="border-width:0"
                  src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><a
               rel="license" href="http://creativecommons.org/licenses/by/4.0/"></a>
         </div>
      </div>
        </body>
    </html>