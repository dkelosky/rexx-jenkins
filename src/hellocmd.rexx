)CMD FAKECMD
)INIT
 say 'Hello command rule enabled' /* OPY1000I Hello command rule fired */
)PROC
 say 'Hello command rule fired'
 return accept
)TERM
 say 'Hello command rule disabled'
)END
