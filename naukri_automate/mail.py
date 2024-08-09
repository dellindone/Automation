import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import config

# Email credentials
sender_email = config.account_name
app_password = config.app_password
receiver_email = config.account_name

def send_mail(subject, body):
    # Email content
    # subject = "Test Email from Python"
    # body = "This is a test email sent from a Python script!"

    # Create the email
    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = receiver_email
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'plain'))

    # Set up the SMTP server
    try:
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()  # Secure the connection
        server.login(sender_email, app_password)
        text = msg.as_string()
        server.sendmail(sender_email, receiver_email, text)
        print("Email sent successfully!")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        server.quit()
