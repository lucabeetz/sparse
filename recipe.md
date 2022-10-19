---
# General Epoch/LR variables
num_epochs: &num_epochs 10
lr: &lr 0.008

# Pruning variables
pruning_start_epoch: &pruning_start_epoch 1.0
pruning_end_epoch: &pruning_end_epoch 8.0
pruning_update_frequency: &pruning_update_frequency 0.5
init_sparsity: &init_sparsity 0.05

prune_low_target_sparsity: &prune_low_target_sparsity 0.8
prune_mid_target_sparsity: &prune_mid_target_sparsity 0.85
prune_high_target_sparsity: &prune_high_target_sparsity 0.9

training_modifiers:
  - !EpochRangeModifier
    start_epoch: 0.0
    end_epoch: *num_epochs

  - !SetLearningRateModifier
    start_epoch: 0.0
    learning_rate: *lr

pruning_modifiers:
  - !GMPruningModifier
    params:
      - layer1.0.conv1.weight
    init_sparsity: *init_sparsity
    final_sparsity: *prune_low_target_sparsity
    start_epoch: *pruning_start_epoch
    end_epoch: *pruning_end_epoch
    update_frequency: *pruning_update_frequency
---