part of 'vote_cubit.dart';

class VoteState extends Equatable {
  final int vote;
  final int voteUpCount;

  const VoteState(this.vote, this.voteUpCount);

  @override
  List<Object> get props => [UniqueKey().hashCode];
}
