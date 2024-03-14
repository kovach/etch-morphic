.PHONY: test

test: out.json
	cat out.json | jq '.timings | .[] | .specializations[0].total_clock_nanos/1e6'

out.json: stream
	MORPHIC_PROFILE_PATH=out.json ./stream;

stream: stream.mor
	morphic build --profile Stream.test3 stream.mor
