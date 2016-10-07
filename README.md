# At Risk
Application for Orinda PD

[![Code Climate](https://codeclimate.com/github/rails/rails/badges/gpa.svg)](https://codeclimate.com/github/rails/rails)
[![Build Status](https://travis-ci.org/MattZhao/AtRisk.svg?branch=master)](https://travis-ci.org/MattZhao/AtRisk)

Link to deployed app on Heroku: ???

Link to Pivotal Tracker: https://www.pivotaltracker.com/projects/1886649

**Background/Problem:**
Care facilities missing old people. Orinda families missing young children. They just walk away without letting others know that really sucks. We need a system to keep track of all the people who has a potential to get lost

**Current Solution:**
The PD keeps a physical binders of their info (name, DoB, characteristics, medical condition, etc. ) with their photos. Populate the binder with physical forms filled out by the targets’ families and friends. Once the target is missing their parents/care center will call the police department, and the PD will be able to start searching immediately with he available info in the binder. *Problem:* there is only one binder, which means they will need to get back to the office, grab the binder, and then get the info. Also updating the binder could be a hassle.

**Desired Solution from Us:**
Digitalize the binder as a web application! The application will be accessed via browsers on PC and Mac. We are currently not considering making this mobile compatible, but that would definitely be a plus. There are 2 groups of users: 1. Orinda family/guardians of the target. They will be able to: log in to the system, create new record for their target(s) with appropriate information (photos, etc.) or update them, or download the information as pdf files (can customize the pdf. e.g. hide medical history). They will only be able to access the entries that are created by themselves. 2. Orinda police officers. They will be able to: view all targets stored in the system, delete any record (consider giving family users this feature?), download the information of one target as a pdf file (can customize the pdf. e.g. hide medical history), and with one-click, send the pdfs to police officers (phones, emails), medias, etc..
