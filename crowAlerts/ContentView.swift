import SwiftUI

//force sleep now
//let task = Process()
//task.launchPath = "/usr/bin/env"
//task.arguments = ["pmset", "sleepnow"]
//task.launch()


//end time seems redundant, since you just replace it with new tasks start
//perhaps write unit tests for all basic building blocks, will actually be easier/faster lol
//can already sense some edge cases here, which tests will run through quick
struct ContentView: View {
    @State private var isAlertVisible = false
    @State private var day = DaySchedule(periodCollection: [
        DaySchedule.Period(
            name: "Awake",
            timeStart: DateHelper.getTodayDate(atHour: 8, atMinute: 0),
            timeEnd: DateHelper.getTodayDate(atHour: 10, atMinute: 25),
            startAction: {
                print("good morning")
            },
            endAction: {
                print("time to work")
            }),
        DaySchedule.Period(
            name: "Work",
            timeStart: DateHelper.getTodayDate(atHour: 10, atMinute: 30),
            timeEnd: DateHelper.getTodayDate(atHour: 15, atMinute: 0),
            startAction: {
                print("work")
            },
            endAction: {
                print("end of work")
            }),
        DaySchedule.Period(
            name: "Maintenance",
            timeStart: DateHelper.getTodayDate(atHour: 15, atMinute: 0),
            timeEnd: DateHelper.getTodayDate(atHour: 20, atMinute: 0),
            startAction: {
                print("start maintainenance")
            },
            endAction: {
                print("end of maintaienance")
            }),
        DaySchedule.Period(
            name: "End",
            timeStart: DateHelper.getTodayDate(atHour: 20, atMinute: 0),
            timeEnd: DateHelper.getTodayDate(atHour: 6, atMinute: 0), //should be tomorrow
            startAction: {
                print("end of day start")
            },
            endAction: {
                print("end end end")
            })
    ])
    @State private var currentPeriod: Int = 0

    var body: some View {
        ZStack {
            if isAlertVisible {
                Color.red
                    .opacity(1)
                    .ignoresSafeArea()
                    .overlay(
                        VStack {
                            Text("PERIOD IS: \(day.periodCollection[currentPeriod].name)")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()

                            Button("Dismiss") {
                                isAlertVisible.toggle()
                            }
                            .font(.headline)
                            .padding(.top, 20)
                        }
                    )
                    .onAppear {
                        NSApp.activate(ignoringOtherApps: true)
                        //autohide
                        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                            isAlertVisible = false
                        }
                    }
            }
        }
        .onAppear {
            day.periodCollection.forEach { period in
                period.startAction()
                let interval = TimeInterval(floatLiteral: DateHelper.getDateDifference(dateToCompareTo: period.timeStart))
                Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
                    currentPeriod += 1
                    isAlertVisible = true
                }
            }
        }
    }
}

//
//Lifecycle of a day:
//    Awake- startMorningRoutine() -> startPersonalWork()
//    Work - startWork() -> End by 15:00?
//    Maintenance - startChores() -> startRest()
//    End - startSleepRoutine()
//
//Life is just your one day multiplied x99999. So make today count
//
//startMorningRoutine {
//        *still need to experiment with what feels good and works well*
//drink water and actimel
//go for a walk
//    startPersonalWork() {
//apps, games, self development as programmer goes in here
//anything that also makes me excited to get done. Current professional passions in short
//    }
//}
//
//startWork {
//do work
//look to start at the latest 10
//look to end at around 15
//small time frame, so work is more efficient and isn't dragged across whole day and stress me out constantly as it does now
//}
//
//startChores {
//walk for 20km, how about that lul
//lunch
//all the basic household shit
//clean
//finances
//exercise
//    startRest() {
//for fun, "useless activities with no gain", all social things go here
//bikes, drifting, guitar, writing, reading, music etc.
//stay away from work, even if you want to, feel curious about work related things etc. NO STOP
//THIS IS STRICTLY FOR FUN ZONE, RUN FROM WORK, JUST RUN
//    }
//}
//
//startSleepRoutine {
//    * no idea yet, but staying away from screens is good
//face wash and eye creme
//shower
//??????????????
//}
