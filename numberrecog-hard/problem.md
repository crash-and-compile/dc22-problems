<!-- RATING: Hard -->
<!-- NAME: Number Recognition -->
<!-- GENERATOR: generate.pl -->
# Number Recognition

Let's see if you can handle a simple CAPTCHA problem. I'll give you a
challenge, you tell me the number I'm looking for.

I will give you a string that is the Base64 encoded representation of
a PNG file. Tell me how many black lines are in the PNG image.

## INPUT
The input will consist of a series of lines that should be concatenated
together to form a single string. This string is your Base64 encoded image. 

## The Output
Print the number of black lines in the image.

## Sample input
	iVBORw0KGgoAAAANSUhEUgAAAGQAAABkAQMAAABKLAcXAAAABlBMVEX///8AAABVwtN+AAAA0klE
	QVQ4jc2TsQ3CMBBFfcayrqC4MqXZICOYTTKKxWQZjYAE+o8iQhSAuydFeS/nS0q/PR3UQLFDDiqg
	DLIdSuPDGN+h92Ne9F+NKYjJ0NuAvoMaYgIxDn2F3hgzMJmOycyYhUNfQBkxW7dOpmMWDfqA3kEV
	McaLGbiYjouZQY6YgpiMGOOWrKCGnQnEOGIq9MadGYFun1VRjkJTPmi3qTFbWlQxJu3u+lGt6Wsi
	0irdkcRfXWdj5bY4z3O5b+PjnJP6T1i+SZ7burtSbkp/8DNfAcHYFsaKqkCsAAAAAElFTkSuQmCC

## Sample output
	3
