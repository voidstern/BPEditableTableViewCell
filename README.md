# BPEditableTableViewCell

Some editable UITableViewCell subclasses for Cocoa Touch applications based on [jon/BPEditableTableViewCell](https://github.com/jon/BPEditableTableViewCell) and [lavoy/ALActionBlocks](https://github.com/lavoy/ALActionBlocks) to quickly build settings screens (and whatever else you need editable UITableViewCells for).


## Cell Types

* BPSliderEditableTableViewCell
* BPStepperEditableTableViewCell
* BPSwitchEditableTableViewCell
* BPTextFieldEditableTableViewCell

Both slider- and steppercells display the current value as text.


## Usage
Here's a switch cell as example (It'll look exactly as you'd expect - a tableviewcell with a switch on it).

    BPSwitchEditableTableViewCell *cell = [[BPSwitchEditableTableViewCell alloc] initWithLabel:@"Some Label" boolValue:YES reuseIdentifier:@"switchCell" andBlock:^(UISwitch *weakControl){
                BOOL someValue = weakControl.on;
            }];
