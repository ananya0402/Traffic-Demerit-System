# Traffic-Demerit-System

1. The local state government wishes to develop a database to record the details of
"on-the-spot" traffic offences incurred by drivers. When a driver commits an offence they
are stopped and booked "on the spot" by a police officer and provided with an offence
notice. Offences cause drivers to incur demerit points which accumulate against the
drivers licence.
The system needs to record details of all registered vehicles driven in the local
government area. A vehicle is identified by a Vehicle Identification Number (VIN).
Background reading on a VIN is available from several sites such as AutoCheck . The
government wishes to record the type of vehicle, such as motorbike, car, truck etc, the
year the vehicle was manufactured and the model such as CX3, as vehicle attributes.
Vehicles are produced by manufacturers such as Ford, Mazda etc. Each manufacturer is
to be assigned a unique manufacture code, in addition the system must record the
manufacturers name and the country in which the manufacturer is based (for example
Ford is based in America, Mazda is based in Japan).
Drivers are identified by their licence number. The attributes which are to be recorded for a
driver are the driver's first name, last name, residential address and date of birth. The
government also wish to have recorded the expiry date for a driver's licence and the total
number of demerit points the driver has accumulated.
Each demerit (potential driving offence) is identified by a demerit code. A description of the
demerit and the number of points incurred for that demerit are to be stored. For example
the demerit with code 05, has a description of "Failing to give way" and results in 3 demerit
points being incurred by the driver.
Each traffic offence by a driver is identified by an offence number.The location of the
offence and the date and time at which the offence occurred are to be stored. In some
circumstances when a driver is stopped by a police officer for say, a speeding offence, the
police officer may also identify other offences such as "Driving contrary to a major defect
notice". Each offence recorded has a unique offence number and is for a particular (ie one)
demerit. The police officer who issued the offence must also be recorded.
Once a driver has accumulated 12 demerit points over a period of three years the driver’s
licence is suspended for a period of 6 months. When this occurs the driver’s licence is
suspended from the date recorded for the offence which caused the points to equal or
exceed the permitted maximum. The local state government informs the driver of their
suspension via a letter sent through the post to the drivers registered address. The date at
which the suspension began and the date at which it ends are to be stored in the system.
Police officers are identified by an officer id. The system should record the officer's first
name, last name and rank e.g. constable, sergeant etc. Police officers are based in Police
Stations, each station has one officer who is in charge of the station (a station is required
to always have an officer in charge). Officers are assigned, from a particular date, to a
station for a minimum of two years, after this time they may apply to move to a different
station. Within these allocations some officers may return to a station they were previously
allocated to. Police stations are identified by a station number. In addition the government
wishes to record the stations' address, direct contact phone number and if the station is
open 24 hours a day or not.


2. Further discussions with the local government authority have revealed that some demerits,
particularly blood alcohol charges (BAC), are regarded as serious demerits and lead to an
immediate licence cancellation. As well as recording the demerit details you have depicted in
assignment 1, the authority needs to have recorded, for each demerit, if the demerit leads to an
automatic cancellation and for those that do, the number of months for which the licence will be
cancelled. When a licence is cancelled, its expiry date is set to the date of the offence which
triggered the cancellation. Cancelled drivers need to apply to a court to get their licence back. If
granted the driver will be reinstated under their old licence number.
The local government authority have provided three of the forms, depicted below, which they make
use of showing some of the data they wish to record:
● a sample vehicle report,
● two sample driver reports, and
● a driver cancellation report.

The tds_conceptual and the assumptions file is with reference to point 1.
