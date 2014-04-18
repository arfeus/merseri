function myFunction()
{
x = document.getElementById("demo"); // Find the element with id="demo"

if (x.style.fontSize.match("20px"))
{
	x.style.fontSize = "13px";
}
else 
{
	x.style.fontSize = "20px";
}

}