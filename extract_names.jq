[. as $all | paths(.displayProperties?.name?)
  | . as $path | ($all | getpath($path)) as $val
  | {
  	  ("." + (. | join("."))): {
        name: $val.displayProperties.name,
        description: $val.displayProperties.description?,
      },
    }
] | add
