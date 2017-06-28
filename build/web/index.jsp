
<html>
    <head>
        <title>PassGen</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .every{
                margin: 20px 20px 20px 20px;
            }
            .input{
                margin-left: 20px;
                
            }
            table{
                border: black 1px solid;
                width: 10em;
                height: 2em;
            }
            
        </style>
    </head>
    <body>
        <h2 class="every">Welcome to A Simple UI Password Generator</h2>
        <p class="every">Please Select What you want</p>
        <form  method="post" onsubmit="solve();return false;">
            <input id="num" class="input" type="checkbox" name="number" value="number" > Numbers<br>
            <input id="salpha" class="input" type="checkbox" name="smallalpha" value="smallaplha"> Small Alphabets<br>
            <input id="calpha" class="input" type="checkbox" name="capalpha" value="capalpha"> Capital Alphabets<br>
            <input id="special" class="input" type="checkbox" name="special" value="special"> Special Character<br>
            <span class="input">Length</span><input id="length" class="input" type="text" name="length" />*(between 6-30)<br>
            <input type="submit" class="input" value="Generate"><br>
        </form>
        <table class="input">
            <tr>
                <td  id="password"></td>
            </tr>
        </table>
        <p id="tp1"></p>
        <p id="tp2"></p>
        <p id="tp3"></p>
        
        
        <script>
            function solve()
            {
                document.getElementById('password').innerHTML=generator();
                
            }
            function generator()
            {
                var pass="";
                //var cb=document.forms[0];
                var arr=['','','',''];
                var num = document.getElementById('num').checked;
                var saplha = document.getElementById('salpha').checked;
                var calpha = document.getElementById('calpha').checked;
                var special = document.getElementById('special').checked;
                var len=parseInt(document.getElementById('length').value);
 
                var smallalpha = "abcdefghijklmnopqrstuvwxyz"; //to upper 
                var capalpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                var number = '0123456789';
                var spec= ['!','@','#','$','%','^','&'];//,'*','(',')','_','+','~','|','}','{','[',']','\\',':',';','?','>','<','/','-','=' ];
                /*var number=[0,1,2,3,4,5,6,7,8,9];
                var smallalpha=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
                var capalpha=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                var spec=['!','@','#','$','%','&','*','(',')','?','{','}','[',']'];
                */var noOfCheckedElement=0;
                var i=0;
                if(num===true)
                {
                    noOfCheckedElement++;
                    arr[i++]="num";
                }
                if(saplha===true)
                {
                    noOfCheckedElement++;
                    arr[i++]="small";
                }
                if(calpha===true)
                {
                    noOfCheckedElement++;
                    arr[i++]="cap";
                }
                if(special===true)
                {
                    noOfCheckedElement++;
                    arr[i++]="special";
                }
                /*for(var j=0;j<=arr.length;j++)
                    writeln(arr[j]);*/
                for(i=0;i<len;)
                {
                    var select=Math.floor(Math.random()*noOfCheckedElement);
                    var three=Math.floor(Math.random()*3);
                    if(i+three<len)
                        i+=three;
                    else
                    {
                        three=len-i;
                        i=len;
                    }
                    if(arr[select]==="num")
                    {
                        for(var j=0;j<three;j++)
                        {
                            var rand=Math.floor(Math.random()*(number.length));
                            pass=pass+number[rand];
                        }
                    }
                    else
                        if(arr[select]==="small")
                        {
                            for(var j=0;j<three;j++)
                            {
                                var rand=Math.floor(Math.random()*(smallalpha.length));
                                pass=pass+smallalpha[rand];
                            }
                        }
                        else
                            if(arr[select]==="cap")
                            {
                                for(var j=0;j<three;j++)
                                {
                                    var rand=Math.floor(Math.random()*(capalpha.length));
                                    pass=pass+capalpha[rand];
                                }
                                
                            }
                            else
                                if(arr[select]==="special")
                                {
                                    for(var j=0;j<three;j++)
                                    {
                                        var rand=Math.floor(Math.random()*(spec.length));
                                        pass=pass+spec[rand];
                                    }
                                }
                }
                return pass; 
            }
        </script>
    </body>
</html>
