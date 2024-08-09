def edit_text(text):
    return text[:-2] + '.' if text[-2] == ' ' else text[:-1] + ' .'
