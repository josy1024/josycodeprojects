# rename all fotos (order by lastwritetime) do GPPRO0001.jpg (in sequentail order)
#
ls *.jpg | sort -property LastWriteTime | %{Rename-Item $_ -NewName ('GOPR{0:D4}.jpg' -f $i++)}
