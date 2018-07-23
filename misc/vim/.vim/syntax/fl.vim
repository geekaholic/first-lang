" Vim syntax file
" Language: FirstLang
" Maintainer: Bud Siddhisena <bud@geekaholic.org>
" Latest Revision: Jul 10 2018

if exists("b:current_syntax")
  finish
endif

let b:current_syntax='myl'
" syn region firstlangFold start="" end="End" transparent fold
syn region  firstlangString       start=+"+ end=+"+ end=+$+

syn match   firstlangComment "#.*"
syn match   firstlangComment "//.*"
syn keyword firstlangDisplay Print
syn keyword firstlangKeyword Var Const Let End Self Singleton
syn keyword firstlangStatement Return Continue Break New
syn keyword firstlangConditional If Else Elseif ElseIf Then Select When
syn keyword firstlangLoop  While Do For Foreach
syn match   firstlangFunctionName  "[a-zA-Z_0-9]*\s*("
syn keyword firstlangFunction Function Method nextgroup=firstlangFunctionName skipwhite
syn keyword firstlangClass  Class Inherit Implements
syn match   firstlangClassName  ":[a-zA-Z][a-zA-Z_0-9]*\s+"
syn keyword firstlangInterface  Interface
syn keyword firstlangMixin  Mixin Mix
syn keyword firstlangConstants TRUE FALSE NULL
syn keyword firstlangScope  Public

hi def link firstlangDisplay Statement
hi def link firstlangKeyword Keyword
hi def link firstlangConditional Conditional
hi def link firstlangComment Comment
hi def link firstlangLoop Repeat
hi def link firstlangFunction Keyword
hi def link firstlangFunctionName Function
hi def link firstlangClass Keyword
hi def link firstlangClassName Function
hi def link firstlangInterface Keyword
hi def link firstlangMixin Keyword
hi def link firstlangString String
hi def link firstlangStatement Statement
hi def link firstlangConstants Boolean
hi def link firstlangScope  StorageClass
