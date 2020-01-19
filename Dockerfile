FROM f69m/ubuntu32:lts

# update/upgrade base system
RUN apt-get update
RUN apt-get -yq upgrade

# install requirements for optic planner (since we are going for the binary version not all of this is required)
RUN apt-get install --no-install-recommends -y --no-install-recommends apt-utils\
	build-essential \
	g++\
	gcc\
	make\
	cmake\
	python\
	ca-certificates \
	xutils-dev \
	scons \
	gcc-multilib \
	flex \
	bison \
	python3 \
	libboost-dev \
	libjudy-dev \
	libboost-program-options-dev \
	g++-multilib \
	libgmp3-dev \
	gawk\
	pypy\
	python-pyparsing\
	python-psutil\
	libncurses5-dev\
	unzip\
	wget

WORKDIR /opt

COPY ipc-2018.zip /opt

RUN unzip ipc-2018.zip
RUN ./src/build

COPY ./domains /opt/domains
COPY ./problems /opt/problems

CMD ["./src/src/yahsp3-mt/cpt-yahsp/release/cpt_yahsp-mt","-o", "/opt/domains/chain-domain.pddl", "-f", "/opt/problems/chain-problem.pddl"]
