#Include _MD_Gen.ahk

dir := A_ScriptDir

If FileExist(A_ScriptDir "\temp.html")
    FileDelete(A_ScriptDir "\temp.html")

md_txt := FileRead("index.md")

css := FileRead("style.css")

code := {comma:"#60F"
       , par:"#60F" ; ()
       , bk:"#60F" ; []
       , bc:"#60F" ; {}
       , tag:"#F00" ; <...>
       , str:"#066" ; '' and ""
       , math:"#06F" ; + - * / & ^ | !
       , compare:"#0CF" ; && || == > < >= <=
       , assign:"#06F" ; = :=
       , number:"#0FF" ; not yet supported
       , objdot:"#06F"
       , comment:"#080"
       , flat_comments:true
       }

options := {css:css
          , font_name:"Segoe UI"
          , font_size:16
          , font_weight:400
          , line_height:1.6
          , code:code
          , debug:false}

html := make_html(md_txt, options, true) ; true/false = use some github elements

FileAppend html, A_ScriptDir "\temp.html", "UTF-8"

Run '"' A_ScriptDir '\temp.html"' ; open and test



dbg(_in) { ; AHK v2
    Loop Parse _in, "`n", "`r"
        OutputDebug "AHK: " A_LoopField
}