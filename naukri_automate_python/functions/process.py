import time

from functions.config import Variables as var, Detials as info
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait


class Custom:
    def edit_text(self, text):
        return text[:-2] + '.' if text[-2] == ' ' else text[:-1] + ' .'

    def click_element_by_xpath(self, driver, xpath: str):
        WebDriverWait(driver, 10).until(lambda x: x.find_element(By.XPATH, xpath))
        driver.find_element(By.XPATH, xpath).click()

    def input_text_by_xpath(self, driver, xpath: str, value: str):
        driver.find_element(By.XPATH, xpath).send_keys(value)

    def get_element_inserted_text(self, driver, xpath: str):
        return driver.find_element(By.XPATH, xpath).get_attribute('value')

    def clear_text(self, driver, xpath: str):
        driver.find_element(By.XPATH, xpath).clear()

class Process(Custom):
    def launch_chrome(self, driver):
        driver.get(var.home_page)

    def login(self, drive):
        drive.maximize_window()
        Custom().input_text_by_xpath(drive, var.login_placeholder, info.account_name)
        Custom().input_text_by_xpath(drive, var.password_placeholder, info.password)
        Custom().click_element_by_xpath(drive, var.login_button)

    def navigate_profile(self, driver):
        Custom().click_element_by_xpath(driver, var.profile_button)
        WebDriverWait(driver, 1).until(lambda x: x.find_element(By.XPATH, var.view_profile))
        Custom().click_element_by_xpath(driver, var.view_profile)

    def edit_headlines(self, driver):
        Custom().click_element_by_xpath(driver, var.edit_resume_headline_button)
        attribute_value = Custom().get_element_inserted_text(driver, var.resume_headline_textarea)
        edited_text = Custom().edit_text(attribute_value)
        time.sleep(0.5)
        Custom().clear_text(driver, var.resume_headline_textarea)
        Custom().input_text_by_xpath(driver, var.resume_headline_textarea, edited_text)
        Custom().click_element_by_xpath(driver, var.save_button)

    def confirmation(self, driver):
        confirmation_value = WebDriverWait(driver, 5).until(lambda x: x.find_element(By.XPATH, var.confirmation_button)).text
        if 'success' in confirmation_value:
            return 'Success'
        else:
            return 'Failed'

    def update_profile(self, driver):
        self.navigate_profile(driver)
        self.edit_headlines(driver)
        status = self.confirmation(driver)




