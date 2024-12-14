<html>
<head>
    <title>[== (print "Generic Tarragon Served Page") ==]</title>
</head>
<body>
    [==
      (each [i v (ipairs [1 102 2003 30004 400005])
        (print (.. "<p>" "Index " i ": " v "</p>")))
    ==]
</body>
</html>

[==
    (print "This is just some post-processing...")
==]
