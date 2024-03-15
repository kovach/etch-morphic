.PHONY: test out.json

test: out.json
	cat out.json | jq '.timings | .[] | .function, .specializations[0].total_clock_nanos/1e6'

out.json: stream
	MORPHIC_PROFILE_PATH=out.json perf record -g --call-graph dwarf ./stream

stream: stream.mor
	morphic build --profile Stream.test3 --profile Stream.test4 stream.mor
