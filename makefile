SRCDIR := src
BUILDDIR := build
OUTPUTDIR := data_out
TARGET := run
 
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))

CC := g++ 
DEBUG := -g
OPTIMIZE := -O3
CFLAGS := -Wall $(OPTIMIZE) 
LFLAGS := -Wall 
LIB := -lm
INC := -I include

RM := rm

$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@echo " $(CC) $(LFLAG) $^ -o $(TARGET) $(LIB)"; $(CC) $(LFLAG) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(BUILDDIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c $< -o $@"; $(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
	@echo " Cleaning..."; 
	@echo " $(RM) -r $(BUILDDIR) $(OUTPUTDIR) $(TARGET)"; $(RM) -r $(BUILDDIR) $(OUTPUTDIR) $(TARGET)

.PHONY: clean
