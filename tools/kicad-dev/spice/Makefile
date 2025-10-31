PLUGIN_NAME ?= $(MF_LIB)
XYCE_DIR=/usr/local/stow/Xyce/7.8-adms
XYCE_INST_DIR=${XYCE_DIR}/bin
XYCE_INCLUDE_DIR=${XYCE_DIR}/include
XYCE_DATA_DIR=${XYCE_DIR}/share
XYCE_LIBEXEC_DIR=${XYCE_DIR}/libexec
XYCE_LIB_DIR=${XYCE_DIR}/lib
XYCE_XML_DIR=${XYCE_DATA_DIR}/xml
TRILINOS_DIR=/usr/local/stow/Trilinos/12.12-serial
SUITESPARSE_INCLUDE_DIR=/usr/include/suitesparse
ADMS_INCLUDE_DIR=/usr/local/stow/adms/2.3.7/include

INSTALL=/usr/bin/install -c
CPPFLAGS=-DXyce_NOX_LOCA_SUPPORT -I${TRILINOS_DIR}/include -I${SUITESPARSE_INCLUDE_DIR} -I${ADMS_INCLUDE_DIR}
CXXFLAGS=-Wl,-rpath,/../lib -O3
LDFLAGS=-L${TRILINOS_DIR}/lib
CXX = gcc
LIBTOOL = libtool

MODULES=$(patsubst %.va,%,$(notdir $(VA_COPIES)))
MODULES_H=$(patsubst %.va, N_DEV_ADMS%.h,$(notdir $(VA_COPIES)))
OBJFILES=$(patsubst %.h,%.lo,$(MODULES_H))
MODULES_O=$(patsubst %.va, %.osdi,$(wildcard *.va))

%.osdi: %.va
	openvaf $<

osdi: $(MODULES_O)


all: osdi

${PLUGIN_NAME}_bootstrap.C: ${MODULES_H}
	echo ${MODULES_H}
	echo "#include <Xyce_config.h>" >  $@
	echo $(foreach MODULE,$(MODULES),"#include <N_DEV_ADMS"${MODULE}".h>\n") | sed 's/\\n */\n/g' >> $@
	echo "struct Bootstrap ">>   $@
	echo "{">>   $@
	echo "  Bootstrap()" >>   $@
	echo "  {" >>   $@
	echo $(foreach MODULE,$(MODULES),"    Xyce::Device::ADMS${MODULE}::registerDevice();\n")  | sed 's/\\n/\n/g' >> $@
	echo "  }" >>   $@
	echo "};" >>   $@
	echo "Bootstrap s_bootstrap;" >>   $@

N_DEV_ADMS%.C N_DEV_ADMS%.h: %.va
	admsXml -D__XYCE__ -x -e ${XYCE_XML_DIR}/adms.implicit.xml \
		-e ${XYCE_XML_DIR}/xyceVersion_nosac.xml \
		-e ${XYCE_XML_DIR}/xyceBasicTemplates_nosac.xml \
		-e ${XYCE_XML_DIR}/xyceAnalogFunction_nosac.xml \
		-e ${XYCE_XML_DIR}/xyceHeaderFile_nosac.xml \
		-e ${XYCE_XML_DIR}/xyceImplementationFile_nosac.xml $<

%.o %.lo: %.C
	${LIBTOOL} --tag=CXX --mode=compile ${CXX} \
		-I. -I${XYCE_INCLUDE_DIR} \
		${CPPFLAGS} ${CXXFLAGS} \
		-c $< \
		-fPIC -DPIC \
		-o $@

${PLUGIN_NAME}.la ${PLUGIN_NAME}.so &: $(VA_COPIES) $(VAMS_COPIES) ${PLUGIN_NAME}_bootstrap.lo $(OBJFILES)
	${LIBTOOL} --tag=CXX --mode=link ${CXX} \
		-module -shared \
		-avoid-version ${CXXFLAGS} \
		-fPIC -DPIC ${LDFLAGS} \
		-o ${PLUGIN_NAME}.la \
		-rpath ${XYCE_LIB_DIR} \
		${OBJFILES} \
		${PLUGIN_NAME}_bootstrap.lo
	cp .libs/${PLUGIN_NAME}.so ${PLUGIN_NAME}.so

clean_xyce:
	rm -f ${PLUGIN_NAME}_bootstrap.lo ${PLUGIN_NAME}_bootstrap.C ${PLUGIN_NAME}_bootstrap.o
	rm -f N_DEV_ADMS*.C N_DEV_ADMS*.h N_DEV_ADMS*.lo N_DEV_ADMS*.o
	rm -f ${PLUGIN_NAME}.la ${PLUGIN_NAME}.so
	rm -f .adms*.xml .interface*.xml .*.adms *.vams
	rm -r .libs

install: ${PLUGIN_NAME}.la
	${LIBTOOL} --mode=install ${INSTALL} -c ${PLUGIN_NAME}.la "${DESTDIR}"

.PHONY: install all clean
