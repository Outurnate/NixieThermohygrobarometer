#ifndef DEBUG_HPP
#define DEBUG_HPP

#define DEBUG // comment out to disable debuggery

#ifdef DEBUG
#define DPRINT(x) Serial.println(x);
#else
#define DPRINT(x)
#endif

#endif
