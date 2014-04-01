import ConfigParser
config = ConfigParser.RawConfigParser()

class Conf:
	"""class Conf for writing and reading config DB"""
	def __init__(self, section = "MySQL"):
		self.section = section
		self.file_name = "conf.cfg"


	def write(self):
		config.add_section(self.section)
		config.set(self.section, "host", "localhost")
		config.set(self.section, "user", "root")
		config.set(self.section, "password", "Install_new!")
		config.set(self.section, "db", "test")
		with open(self.file_name, "wb") as config_file:
			config.write(config_file)


	def read(self):
		config.read(self.file_name)
		return [config.get(self.section, "host"), config.get(self.section, "user"),
		        config.get(self.section, "password"), config.get(self.section, "db")]