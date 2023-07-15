proc build {root directory formatt} {
	puts "Building folder $directory"

	foreach file [glob -directory $root/$directory *.$formatt] {
		vlog +acc $file
	}
}

proc buildFolders {root folders} {
    foreach folder $folders {
		set directory [dict get $folder directory]
		set formatt [dict get $folder formatt]
    	build $root $directory $formatt
    }
}

proc addWave {formatt radix signal} {
	add wave -noupdate -format $formatt -radix $radix $signal
}

proc addWaves {waves} {
	foreach wave $waves {
		puts $wave
		set formatt [dict get $wave formatt]
		set radix [dict get $wave radix]
		set signal [dict get $wave signal]
		addWave $formatt $radix $signal
	}
}

proc addDivider {title} {
	add wave -noupdate -divider $title
}

proc addClkRst {tb} {
	addDivider "Clock and Reset"
	set clk_wave [dict create formatt "logic" radix "binary" signal /$tb/clk]
	set rst_wave [dict create formatt "logic" radix "binary" signal /$tb/rst]
	addWaves [list $clk_wave $rst_wave]
}

proc addInputWaves {waves} {
	addDivider "Inputs"
	addWaves $waves
}

proc addOutputWaves {waves} {
	addDivider "Output"
	addWaves $waves
}

proc addInstanceWaves {tb instance} {
	addDivider $instance
	addWave "logic" "binary" "/$tb/top_instance/$instance/*"
}

proc appendToWords {words appended} {
	set out {}
    foreach word $words {
    	append word $appended
		lappend out $word
    }
	return $out
}

proc addToWords {words added} {
	set out {}
	foreach word $words {
		append $added word
		lappend out $word
	}
	return $out
}

proc addOtherWaves {tb instances} {
	addDivider "Other"
	set result [appendToWords $instances "_instance"]
	foreach instance $result {
		addInstanceWaves $tb $instance
	}
}

proc makeWaveform {tb input_waves output_waves instances} {
#	addClkRst $tb
	addInputWaves $input_waves
	addOutputWaves $output_waves
	addOtherWaves $tb $instances
}