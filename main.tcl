source wapp.tcl
package require sqlite3

proc get_csv { dbname query} { 
  sqlite3 db $dbname 
  set r "" 
  # puts $query
  db eval $query values {
    if {$r eq ""} {
      append r [join $values(*) ","]
    }
    set out ""
    foreach xx $values(*) {
      if {$out eq ""} {
        append out "\n" $values($xx)
      } else {
        append out "," $values($xx)
      }
    }
    append r $out
  }
  return $r
}

proc wapp-default {} {
  global wapp
  # puts $wapp
  set name [wapp-param PATH_INFO]
  set hdr [wapp-param .header] 
  set hdrr [join $hdr " "]
  # set req [lindex $hdr 1]
  regexp {\?(.*)HTTP} $hdrr a b 
  # puts $b
  # puts $hdrr
  # puts $query

  set base_query [regsub -all "%20" $b " "]
  set trim_name [regsub "/" $name ""]

  set dbf $::DBFILE 
  # puts $dbf
  # puts $base_query
  set x [ get_csv $dbf $base_query]
  wapp-reply-extra "wapp-reply-extra" "attachment; filename=$trim_name"
  wapp-mimetype {text/csv; charset=utf-8}
  wapp-trim {
     %html($x)
  }
}
wapp-start $argv
