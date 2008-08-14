" Vim syntax file
"    Language: Pro*C (Oracle 7 - 9i), based on sql.vim (vim5.0)
"  Maintainer: Austin Ziegler (austin@halostatue.ca)
" Last Change: 20010723
"         URL: http://www.halostatue.ca/vim/syntax/proc.vim
"
" Notes: This syntax file lets the C and C++ files define most everything,
" then adds the SQL options. Don't use SQL strings with "" only ''.
"
" TODO Make sure that this is current for 8i/9i functions.

    " For version 5.x, clear all syntax items.
    " For version 6.x, quit when a syntax file was already loaded.
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

    " Read C syntax first.
if version < 600
    source <sfile>:p:h/c.vim
else
    runtime! syntax/c.vim
    unlet b:current_syntax
endif

" The SQL reserved words, defined as keywords.
syntax case ignore
syntax keyword procSpecial exec end-exec sql declare begin end section include
syntax keyword procSpecial cursor open close fetch var execute
syntax case match

syntax keyword procType VARCHAR STRING

    " Some useful defines
syntax keyword procSpecial DBE_SQL_NOTFOUND DBE_SQL_OK DBE_SQL_ERROR DBE_SQLERRDESC
syntax keyword procSpecial DBE_SQLERRDESCL DBE_SQLCODE DBE_SQL_CODE DBE_SQLCA DBE_SQLCA_PTR
syntax keyword procSpecial NULL DBE_PLSQLERRDESC DBE_CHECK_SQL_ERROR DBE_CHECK_SQL_ERROR_RETURN
syntax keyword procSpecial DBE_IS_NULL DBE_IS_NOT_NULL
syntax case ignore

syntax keyword procKeyword access add as asc by check cluster column
syntax keyword procKeyword compress connect current decimal default
syntax keyword procKeyword desc else exclusive file for group
syntax keyword procKeyword having identified immediate increment index
syntax keyword procKeyword initial is level maxextents mode modify
syntax keyword procKeyword nocompress nowait of offline on online start
syntax keyword procKeyword successful synonym table then to trigger uid
syntax keyword procKeyword unique user validate values view whenever
syntax keyword procKeyword with option order pctfree privileges
syntax keyword procKeyword public resource row rowlabel rownum rows
syntax keyword procKeyword session share size smallint object allocate
syntax keyword procKeyword collection

syntax keyword procOperator not and or
syntax keyword procOperator in any some all between exists
syntax keyword procOperator like escape
syntax keyword procOperator union intersect minus
syntax keyword procOperator prior distinct
syntax keyword procOperator sysdate

syntax keyword procStatement alter analyze audit comment commit create
syntax keyword procStatement delete drop explain grant insert lock noaudit
syntax keyword procStatement rename revoke rollback savepoint from where
syntax keyword procStatement truncate update set select into

    " Strings and characters:
syntax region procString start=+'+  skip=+\\\\\|\\"+  end=+'+

    " Functions
syntax keyword procFunction trunc count

    " Define the default highlighting.
    " For version 5.x and earlier, only when not done already.
    " For version 5.8 and later, only when and item doesn't have highlighting
    " yet.
if version >= 508 || !exists("did_proc_syn_inits")
    if version < 508
        let did_proc_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink procComment   Comment
    HiLink procKeyword   procSpecial
    HiLink procNumber    Number
    HiLink procOperator  procStatement
    HiLink procSpecial   Special
    HiLink procStatement Statement
    HiLink procString    String
    HiLink procType      Type
    HiLink procFunction  Function

    delcommand HiLink
endif

let b:current_syntax = "proc"

" vim: ts=8 sw=4
