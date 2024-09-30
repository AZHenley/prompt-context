from newspaper import Article
import pyperclip
import sys

def extract_and_copy(url):
    try:
        # Initialize the Article object.
        article = Article(url)
        
        # Download the HTML content.
        article.download()
        
        # Parse the downloaded content.
        article.parse()
        
        # Get the main text content (mostly works).
        main_text = article.text
        
        # Copy the main text to the clipboard.
        pyperclip.copy(main_text)
        print("Article content has been copied to the clipboard.")
        
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_to_clipboard.py <URL>")
    else:
        # url = 'https://austinhenley.com/blog/naturallanguageui.html'
        url = sys.argv[1]
        extract_and_copy(url)    
