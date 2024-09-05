from selenium import webdriver
from functions.process import Process as lc


def main():
    driver = webdriver.Chrome()
    driver.implicitly_wait(1)

    lc().launch_chrome(driver)
    lc().login(driver)
    lc().update_profile(driver)


if __name__ == '__main__':
    main()
